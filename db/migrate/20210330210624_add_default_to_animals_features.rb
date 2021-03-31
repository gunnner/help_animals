class AddDefaultToAnimalsFeatures < ActiveRecord::Migration[6.1]
  def change
    change_column_default :animals, :features, nil
  end
end
