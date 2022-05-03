# This migration comes from solidus_bolt (originally 20220502005041)
class SwapUrlForEnvBooleanInBoltConfiguration < ActiveRecord::Migration[6.1]
  def change
    add_column :solidus_bolt_bolt_configurations, :environment, :integer
    remove_column :solidus_bolt_bolt_configurations, :environment_url, :string
  end
end
