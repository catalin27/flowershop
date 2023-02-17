class Flower
  FLOWER_NAMES = ['rose', 'tulip', 'daisy', 'lily', 'sunflower', 'carnation', 'peony', 'hyacinth', 'lisianthus'].map(&:pluralize)

  def self.name
    FLOWER_NAMES.sample
  end
end
