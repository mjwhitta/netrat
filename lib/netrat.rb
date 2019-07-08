require "socket"

class NetRat
    attr_reader :ip
    attr_reader :port
    attr_reader :socket

    def initialize(port, ip = nil)
        @ip = ip
        @port = port
        @socket = nil
    end

    def listen(options = {})
        options[:keepalive] ||= false

        trap("SIGINT") do
            puts
            return
        end

        if (@ip.nil?)
            server = TCPServer.new(@port)
            server.listen(1)
            @socket = server.accept
        else
            @socket = TCPSocket.open(@ip, @port)
        end

        loop do
            if (IO.select([], [], [@socket, STDIN], 0))
                server.close if (server)
                @socket.close if (@socket)
                return
            end

            begin
                while(!(data = @socket.recv_nonblock(100)).empty?)
                    STDOUT.write(data);
                end
                break if (!options[:keepalive])
            rescue Errno::ECONNRESET
                break if (!options[:keepalive])
            rescue Errno::EAGAIN
            end

            begin
                while (!(data = STDIN.read_nonblock(100)).empty?)
                    @socket.write(data);
                end
                break if (!options[:keepalive])
            rescue Errno::EAGAIN
            rescue EOFError
                break if (!options[:keepalive])
            end

            IO.select(
                [@socket, STDIN],
                [@socket, STDIN],
                [@socket, STDIN]
            )
        end
    ensure
        server.close if (server)
        @socket.close if (@socket)
    end
    alias :connect :listen
end
