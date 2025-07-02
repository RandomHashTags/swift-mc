
import MinecraftBlueprint
import Logging

enum CLIHandler {
    static func listen() {
        /*
        guard let line = get_input() else { return }
        if let label = line.split(separator: " ").first {
            if let command:any Command = GluonServer.shared.commands[String(label)] {
                /*Task {
                    let succeeded:Bool = await command.execute(sender: /* console sender */)
                }*/
            } else {
                ServerMojang.instance.logger.warning(Logger.Message(stringLiteral: "Unknown command: \"" + label + "\""))
            }
        }
        
        Task {
            CLIHandler.listen()
        }*/
    }
    static func get_input() -> String? {
        return readLine()
    }
}