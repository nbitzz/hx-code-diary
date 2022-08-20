import haxe.Http;
import haxe.crypto.Base64;
import haxe.io.Bytes;

class ConsoleObject {
    public function new() {};
    public function log(str:String) {
        trace(str);
    };
}

var console = new ConsoleObject();

class HelloWorld {
    public static function main() {
        //console.log(Std.string(Http));
        //console.log(Std.string(Std));

        console.log(
            ([
                #if (js || neko)
                "H",
                #elseif eval
                Std.string(Http).substr(Std.int(10),Std.int(1)),
                #elseif (cpp || cs)
                Std.string(Http).substr(Std.int(4),Std.int(1)),
                #else
                Std.string(Http).substr(Std.int(5),Std.int(1)),
                #end
                Std.string(true).substr(Std.int(3),Std.int(1)),
                Std.string(false).substr(Std.int(2),Std.int(1))+Std.string(false).substr(Std.int(2),Std.int(1)),
                Base64.encode(Bytes.ofString("\nz")).substr(Std.int(2),Std.int(1)),
                #if (js || neko)
                Std.string(Std).substr(Std.int(2),Std.int(1)),
                #elseif ( eval || cpp || csc )
                " ",
                #else
                Std.string(Std).substr(Std.int(5),Std.int(1)),
                #end
                Base64.encode(Bytes.ofString("'")).substr(Std.int(1),Std.int(1)),
                Base64.encode(Bytes.ofString("\nz")).substr(Std.int(2),Std.int(1)),
                Std.string(true).substr(Std.int(1),Std.int(1)),
                Std.string(false).substr(Std.int(2),Std.int(1))+Base64.encode(Bytes.ofString("{}][")).substr(Std.int(3),Std.int(1))
            ]).join('')
        );
    };
}