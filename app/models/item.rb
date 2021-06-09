class Item < ActiveRecord::Base
  belongs_to :designer
  belongs_to :taxonomy

  def self.list_all
    # puts "----- INCLUDES ACCEPTED TAXONOMIES AND ALL TAXONOMIES --------"
    # items = Item.all.includes(:taxonomy, designer: [:accepted_taxonomies, :all_taxonomies])
    # taxonomies = items.map {|i| [i.designer.name, i.designer.all_taxonomy_ids] }
    # accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    # #exception = items.map {|i| [i.designer.name, i.designer.exception_taxonomy_ids] }
    # puts "ALL TAXONOMIES - EXCEPTED CHANEL [1,2,3,4,5], HERMES [2,3,4,5]"
    # puts taxonomies.inspect
    # puts "ACCEPTED TAXONOMIES - EXPECTED CHANEL [1,2,3,4,5], HERMES [2,3]"
    # puts accepted.inspect
    # puts ""
    # puts ""

    # puts "----- EAGER LOADING ACCEPTED TAXONOMIES AND ALL TAXONOMIES -------- IT BREAKS ALL TAXONOMIES"
    # items = Item.all.eager_load(:taxonomy, designer: [:accepted_taxonomies, :all_taxonomies])
    # taxonomies = items.map {|i| [i.designer.name, i.designer.all_taxonomy_ids] }
    # accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    # puts "ALL TAXONOMIES - EXCEPTED CHANEL [1,2,3,4,5], HERMES [2,3,4,5]"
    # puts taxonomies.inspect
    # puts "ACCEPTED TAXONOMIES - EXPECTED CHANEL [1,2,3,4,5], HERMES [2,3]"
    # puts accepted.inspect
    # puts ""
    # puts ""

    puts "----- EAGER LOADING ALL TAXONOMIES AND ACCEPTED TAXONOMIES -------- IT BREAKS ACCEPTED TAXONOMIES"
    items = Item.where(id:[2]).eager_load(:taxonomy, designer: [:all_taxonomies, :accepted_taxonomies])
    taxonomies = items.map {|i| [i.designer.name, i.designer.all_taxonomy_ids] }
    accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    puts "ALL TAXONOMIES - EXCEPTED HERMES [2,3,4,5]"
    puts taxonomies.inspect
    puts "ACCEPTED TAXONOMIES - EXPECTED HERMES [2,3]"
    puts accepted.inspect
    puts ""
    puts ""

    puts "----- EAGER LOADING EXCEPTION TAXONOMIES AND ACCEPTED TAXONOMIES -------- IT WORKS!"
    items = Item.where(id:[2]).eager_load(:taxonomy, designer: [:exception_taxonomies, :accepted_taxonomies])
    exception = items.map {|i| [i.designer.name, i.designer.exception_taxonomy_ids] }
    accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    puts "EXCEPTION TAXONOMIES - HERMES [4,5]"
    puts exception.inspect
    puts "ACCEPTED TAXONOMIES - HERMES [2,3]"
    puts accepted.inspect
    puts ""
    puts ""

    # puts "----- EAGER LOADING ACCEPTED TAXONOMIES AND EXCEPTION TAXONOMIES -------- IT WORKS!"
    # items = Item.all.eager_load(:taxonomy, designer: [:accepted_taxonomies, :exception_taxonomies])
    # exception = items.map {|i| [i.designer.name, i.designer.exception_taxonomy_ids] }
    # accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    # puts "EXCEPTION TAXONOMIES - EXCEPTED CHANEL [], HERMES [4,5]"
    # puts exception.inspect
    # puts "ACCEPTED TAXONOMIES - EXPECTED CHANEL [1,2,3,4,5], HERMES [2,3]"
    # puts accepted.inspect
    # puts ""
    # puts ""

    # puts "---------- EAGER LOADING ALL TAXONOMIES, ACCEPTED TAXONOMIES AND EXCEPTION TAXONOMIES ------------"
    # items = Item.all.eager_load(:taxonomy, designer: [:all_taxonomies, :accepted_taxonomies, :exception_taxonomies])
    # taxonomies = items.map {|i| [i.designer.name, i.designer.all_taxonomy_ids] }
    # accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    # exception = items.map {|i| [i.designer.name, i.designer.exception_taxonomy_ids] }
    # puts "ALL TAXONOMIES - EXCEPTED CHANEL [1,2,3,4,5], HERMES [2,3,4,5]"
    # puts taxonomies.inspect
    # puts "ACCEPTED TAXONOMIES - EXPECTED CHANEL [1,2,3,4,5], HERMES [2,3]"
    # puts accepted.inspect
    # puts "EXCEPTION TAXONOMIES - EXCEPTED CHANEL [], HERMES [4,5]"
    # puts exception.inspect
    # puts ""
    # puts ""

    # puts "----------"
    # items = Item.all.eager_load(:taxonomy, designer: [:exception_taxonomies, :accepted_taxonomies])
    # #taxonomies = items.map {|i| [i.designer.name, i.designer.all_taxonomy_ids] }
    # accepted = items.map {|i| [i.designer.name, i.designer.accepted_taxonomy_ids] }
    # #rejected = items.map {|i| [i.designer.name, i.designer.exception_taxonomy_ids] }
    # puts "ACCEPTED 4"
    # puts accepted.inspect
    # # puts "REJECTED 3"
    # # puts rejected.inspect
  end
end
