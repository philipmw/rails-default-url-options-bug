require 'spec_helper'

describe CatalogController, type: :request do
  it 'maintains the same behavior before and after a request' do
    puts "BEFORE GET"
    puts "book_index_path=#{book_index_path}"
    puts "book_index_path({})=#{book_index_path({})}"
    puts "book_index_path(b: 'c')=#{book_index_path(b: 'c')}"

    get catalog_index_path

    puts "AFTER GET"
    puts "book_index_path=#{book_index_path}"
    puts "book_index_path({})=#{book_index_path({})}"
    puts "book_index_path(b: 'c')=#{book_index_path(b: 'c')}"
  end
end
