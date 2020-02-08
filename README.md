# Rails Starter API 

## Versions

* Rails 6.0.2.1
* Ruby 2.6.3

## Mentionable Dependencies

* rack-cors
* jbuilder

## Element Generator

If you run `rails generate element MODEL` it will create the model, a migration, a controller, and a route. It will not generate any views however. 

The views (which are in json) are automatically rendered from `app/views/api/v1/elements/*.json.jbuilder`. This was done simply to keep the code DRY. However, if you want to customize what gets returned (and you likely will) you can go ahead and create the your own views for your custom elements.

If you would like for the custom views to be automatically generated, look at the next section on configuration.

## Configuration

There is an initializer file called `starter_api.rb` that so far has one configurable attribute.

It is `Rails.configuration.starter_api[:generate_views_for_elements]` which by default is set to false. If set to true, the generator will also generate jbuilder files for your elements that can then be customized however you'd like.

## Test Suite

There is no test suite yet! Oh no!


