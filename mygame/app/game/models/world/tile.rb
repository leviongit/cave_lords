class Tile
  attr_accessor :height_value, :temperature_value, :moisture_value

  def initialize(x:, y:, size:)
    @x = x
    @y = y
    @size = size
    @height_value = nil
    @temperature_value = nil
    @moisture_value = nil
  end

  def sprite
    if @height_value <= 0.7
      primitive = { x: (@x * @size), y: (@y * @size), w: @size, h: @size, r: 0, g: 0, b: 255, a: 255 }.solid!
    elsif @height_value > 1.5
      primitive = { x: (@x * @size), y: (@y * @size), w: @size, h: @size, r: 255, g: 255, b: 255, a: 255 }.solid!
    else
      primitive = { x: (@x * @size), y: (@y * @size), w: @size, h: @size, r: 100 * @height_value, g: 100 * @height_value, b: 100 * @height_value, a: 255 }.solid!
    end
    primitive
  end
end