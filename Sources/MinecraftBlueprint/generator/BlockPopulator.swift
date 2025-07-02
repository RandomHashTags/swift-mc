
public struct BlockPopulator {
    static func populate(chunk: any Chunk) {
        /*let world = chunk.world
        let world_name = world.name
        let seed:UInt64 = UInt64(world.seed)
        let yMax:HugeFloat = world.yMax, yMin:HugeFloat = world.yMin
        
        let noise:PerlinNoise = PerlinNoise(seed: seed)
        print("BlockPopulator;populate;seed=" + seed.description)
        
        for x in 0..<16 {
            let x_double:HugeInt = HugeInt(x)
            let location_x:HugeInt = (chunk.x * 16) + x_double
            let location_x_string = location_x.description
            for z in 0..<16 {
                let z_double:HugeInt = HugeInt(z)
                let location_z:HugeInt = (chunk.z * 16) + z_double
                let location_z_string = location_z.description
                
                let height:Int = Int( (noise.octavePerlin(x: location_x / 64, y: 0, z: location_z / 64, octaves: 5, persistence: 0.5) + 1.0) * 32.0 )
                print("BlockPopulator;populate;x=" + x.description + ";z=" + z.description + ";height=" + height.description)
                
                for y in yMin..<yMax {
                    let material_identifier_to_assign:String = y > height ? "minecraft.air" : y == -64 ? "minecraft.bedrock" : y < 0 ? "minecraft.stone" : y < yMax-1 ? "minecraft.dirt" : "minecraft.grass"
                    let location:Location = Location(world_name: world_name, x: location_x, y: Double(y), z: location_z, yaw: 0, pitch: 0)
                    let block:Block = Block(material_identifier: material_identifier_to_assign, light_level: 0, location: location)
                    chunk.blocks.insert(block)
                    
                    //print("BlockPopulator;populate;x=" + location_x_string + ",y=" + y.description + ",z=" + location_z_string + ";material_identifier=" + material_identifier_to_assign)
                }
            }
        }*/
    }
}