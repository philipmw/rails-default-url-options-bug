This repo demonstrates a bug in Rails 4.2.0:

```
% rspec action_controller_master.rb
BEFORE GET
catalog_index_path=/catalog
catalog_index_path({})=/catalog
catalog_index_path(b: 'c')=/catalog?b=c
D, [2015-01-14T09:47:44.658317 #89440] DEBUG -- :
D, [2015-01-14T09:47:44.658402 #89440] DEBUG -- :
I, [2015-01-14T09:47:44.658828 #89440]  INFO -- : Started GET "/catalog" for 127.0.0.1 at 2015-01-14 09:47:44 -0800
default_url_options invoked
default_url_options invoked
AFTER GET
catalog_index_path=/catalog
catalog_index_path({})=/catalog?defarg=defval
catalog_index_path(b: 'c')=/catalog?b=c&defarg=defval
```
