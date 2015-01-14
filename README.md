This repo demonstrates a bug in Rails 4.2.0:

```
% rspec spec/controllers/catalog_controller_spec.rb
BEFORE GET
book_index_path=/book
book_index_path({})=/book
book_index_path(b: 'c')=/book?b=c
AFTER GET
default_url_options invoked
book_index_path=/book
book_index_path({})=/book?defarg=defval
book_index_path(b: 'c')=/book?b=c&defarg=defval
```
