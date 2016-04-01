class CreateMovieCategories < ActiveRecord::Migration
  def change
    create_table :movie_categories do |t|
      t.references :movie
      t.references :category

      t.timestamps
    end
  end
end
