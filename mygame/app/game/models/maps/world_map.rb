class WorldMap

  def initialize(width, height, tile_size)
    @width = width
    @height = height
    @tile_size = tile_size
    @height_map = []
  end

  def generate_map
    generate_height_map
    @height_map
  end

  def generate_height_map
    world_seed = 999
    octaves = 4
    persistence = 0.5

    generator = Noise::PerlinNoise.new(@width, @height, Random.new(world_seed))
    height_noise = generator.generate(octaves, persistence)
    @height_map = []

    (0..@width - 1).each do |x|
      x_offset = x * @tile_size
      (0..@height - 1).each do |y|
        y_offset = y * @tile_size
        value = height_noise[x][y]
        primitive = { x: x_offset, y: y_offset, w: @tile_size, h: @tile_size, r: 255 * value, g: 255 * value, b: 255 * value, a: 255 }.solid!
        @height_map << primitive
      end
    end
  end
end