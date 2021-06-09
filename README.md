# active_record_4_issue


This repo demonstrates an issue with ActiveRecord 4 and eager loading multiple has and belongs to many relations.
To try this out, configure your database in config/database.yml

Run migrations and seeds:
`bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed`

Enter console:
`rails c`

Run:
`Item.list_all`

```
irb(main):001:0> Item.list_all
----- EAGER LOADING ALL TAXONOMIES AND ACCEPTED TAXONOMIES -------- IT BREAKS ACCEPTED TAXONOMIES
  SQL (1.4ms)  SELECT `items`.`id` AS t0_r0, `items`.`name` AS t0_r1, `items`.`designer_id` AS t0_r2, `items`.`taxonomy_id` AS t0_r3, `taxonomies`.`id` AS t1_r0, `taxonomies`.`name` AS t1_r1, `taxonomies`.`created_at` AS t1_r2, `taxonomies`.`updated_at` AS t1_r3, `designers`.`id` AS t2_r0, `designers`.`name` AS t2_r1, `designers`.`created_at` AS t2_r2, `designers`.`updated_at` AS t2_r3, `all_taxonomies_designers`.`id` AS t3_r0, `all_taxonomies_designers`.`name` AS t3_r1, `all_taxonomies_designers`.`created_at` AS t3_r2, `all_taxonomies_designers`.`updated_at` AS t3_r3, `accepted_taxonomies_designers`.`id` AS t4_r0, `accepted_taxonomies_designers`.`name` AS t4_r1, `accepted_taxonomies_designers`.`created_at` AS t4_r2, `accepted_taxonomies_designers`.`updated_at` AS t4_r3 FROM `items` LEFT OUTER JOIN `taxonomies` ON `taxonomies`.`id` = `items`.`taxonomy_id` LEFT OUTER JOIN `designers` ON `designers`.`id` = `items`.`designer_id` LEFT OUTER JOIN `designers_taxonomies` ON `designers_taxonomies`.`designer_id` = `designers`.`id` LEFT OUTER JOIN `taxonomies` `all_taxonomies_designers` ON `all_taxonomies_designers`.`id` = `designers_taxonomies`.`taxonomy_id` LEFT OUTER JOIN `accepted_designers_taxonomies` ON `accepted_designers_taxonomies`.`designer_id` = `designers`.`id` LEFT OUTER JOIN `taxonomies` `accepted_taxonomies_designers` ON `accepted_taxonomies_designers`.`id` = `accepted_designers_taxonomies`.`taxonomy_id` WHERE `items`.`id` = 2
ALL TAXONOMIES - EXCEPTED HERMES [2,3,4,5]
[["Hermes", [2, 3, 4, 5]]]
ACCEPTED TAXONOMIES - EXPECTED HERMES [2,3]
[["Hermes", []]]
```

**On rails 5.2.6 we will have the right results.**

The issue only happens on `eager load`, and more than one `has and belongs to many relation` being eager loaded, the order of the queries and repeated values. 
On this example we are loading the Item using the following query: `items = Item.where(id:[2]).eager_load(:taxonomy, designer: [:all_taxonomies, :accepted_taxonomies])`

Designer for the item is Hermes, all_taxonomy_ids is [2,3,4,5] and accepted_taxonomy_ids is [2,3]. The values [2,3] will be stored only a single time for these two relations. 

If we don't have repeated values, we don't have any issues. 
The queries for rails 4.2.11 and rails 5.2.6 are exactly the same, the problem is how AR maps the query to the objects.
