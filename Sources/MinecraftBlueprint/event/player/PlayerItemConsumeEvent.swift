
public protocol PlayerItemConsumeEvent: PlayerEvent, Cancellable, ~Copyable {
    var item: any ItemStack { get }
    
    init(player: any Player, item: inout any ItemStack)
}