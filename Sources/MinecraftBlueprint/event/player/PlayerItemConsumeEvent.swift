public protocol PlayerItemConsumeEvent: PlayerEvent, Cancellable {
    var item: any ItemStack { get }
    
    init(player: any Player, item: inout any ItemStack)
}
