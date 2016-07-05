wifi.setmode(wifi.STATION)
wifi.sta.config("WIFI_NAME","WIFI_PASSWORD")
print(wifi.sta.getip())
D0 = 0
D1 = 1
D2 = 2
D3 = 3
D4 = 4
D5 = 5
D6 = 6
D7 = 7
D8 = 8


gpio.mode(D0, gpio.OUTPUT)
gpio.mode(D1, gpio.OUTPUT)
gpio.mode(D2, gpio.OUTPUT)
gpio.mode(D3, gpio.OUTPUT)
gpio.mode(D4, gpio.OUTPUT)
gpio.mode(D5, gpio.OUTPUT)
gpio.mode(D6, gpio.OUTPUT)
gpio.mode(D7, gpio.OUTPUT)
gpio.mode(D8, gpio.OUTPUT)
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end

         buf = buf.."<h1><b>nodeMCU<br> Web Server by aCo0o</b></h1>";
        buf = buf.."<p>GPIO0 <a href=\"?pin=ON0\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF0\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO1 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO3 <a href=\"?pin=ON3\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF3\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO4 <a href=\"?pin=ON4\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF4\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO5 <a href=\"?pin=ON5\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF5\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO6 <a href=\"?pin=ON6\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF6\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO7 <a href=\"?pin=ON7\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF7\"><button>OFF</button></a></p><hr>";
        buf = buf.."<p>GPIO8 <a href=\"?pin=ON8\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF8\"><button>OFF</button></a></p><hr>";
        
        local _on,_off = "",""
        if(_GET.pin == "ON0")then
              gpio.write(D0, gpio.HIGH);
        elseif(_GET.pin == "OFF0")then
              gpio.write(D0, gpio.LOW);
              
        elseif(_GET.pin == "ON1")then
              gpio.write(D1, gpio.HIGH);
        elseif(_GET.pin == "OFF1")then
              gpio.write(D1, gpio.LOW);
              
        elseif(_GET.pin == "ON2")then
              gpio.write(D2, gpio.HIGH);
        elseif(_GET.pin == "OFF2")then
              gpio.write(D2, gpio.LOW);

        elseif(_GET.pin == "ON3")then
              gpio.write(D3, gpio.HIGH);
        elseif(_GET.pin == "OFF3")then
              gpio.write(D3, gpio.LOW);

        elseif(_GET.pin == "ON4")then
              gpio.write(D4, gpio.HIGH);
        elseif(_GET.pin == "OFF4")then
              gpio.write(D4, gpio.LOW);

        elseif(_GET.pin == "ON5")then
              gpio.write(D5, gpio.HIGH);
        elseif(_GET.pin == "OFF5")then
              gpio.write(D5, gpio.LOW);

        elseif(_GET.pin == "ON6")then
              gpio.write(D6, gpio.HIGH);
        elseif(_GET.pin == "OFF6")then
              gpio.write(D6, gpio.LOW);

        elseif(_GET.pin == "ON7")then
              gpio.write(D7, gpio.HIGH);
        elseif(_GET.pin == "OFF7")then
              gpio.write(D7, gpio.LOW);

        elseif(_GET.pin == "ON8")then
              gpio.write(D8, gpio.HIGH);
        elseif(_GET.pin == "OFF8")then
              gpio.write(D8, gpio.LOW);
              
        
              
        end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)