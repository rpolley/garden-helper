module PlantsHelper
  def display(value, type:)
    nil_placeholder = 'unknown'
    boolean_true = 'yes'
    boolean_false = 'no'
    case type
    when :nilable
      value || nil_placeholder
    when :range
      (lower, upper) = value
      if lower.nil? && upper.nil?
        nil_placeholder
      elsif lower.nil?
        "less than #{upper}"
      elsif upper.nil?
        "more than #{lower}"
      else
        "#{lower} - #{upper}"
      end
    when :array
      if value.nil? || value == []
        nil_placeholder
      else
        render 'shared/array', array: value
      end
    when :boolean
      value ? boolean_true : boolean_false
    end
  end
  def preview_card(plant)
    image_url = plant.image_url || 'plant_not_found.png'
    title = plant.common_name
    details_text = 'Details'
    details_url = plants_path(plant)
    render 'shared/card', image_url: image_url, title: title, details_text: details_text, details_url: details_url
  end
end
