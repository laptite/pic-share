# PicShare

----
## Application Overview
* Rails 6 app uses webpacker to manage js plugins.
* Devise user management and restrictions.
* Pic likes are managed via polymorphic models.
* ActiveStorage and ImageProcessing used to upload and resize images.
* Ajax calls implemented to update views

**Notes:**

* Paperclip was initially implemented for image uploading. Converted to ActiveStorage and ImageProcessing after realizing that Paperclip was deprecated. Image of content-type jpeg and gifs were used for testing.
* Installed jQuery, Masonry and Modernizr to test webpacker. While Modernizr is not commonly used anymore, it was used here to test the Masonry setup with multiple dependencies.

----
## README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions