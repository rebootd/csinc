require 'json'
require 'mongoid'

class Post
	include Mongoid::Document

  field :title, :type => String
	field :body, :type => String
	field :published_on, :type => DateTime
  field :updated_at, :type => DateTime
	field :created_at, :type => DateTime
	field :slug, :type => String
	field :category, :type => String

  def get_summary()
    self.body.gsub(/(<[^>]*>)|\n|\t/,'')[0..199] + '...'
  end

  def self.find_by_slug(val, pub_only)
    post = Post.where(:slug => val)
    post = post.first if post
    return post if pub_only && post != nil && post.published_on.lte >= Time.now
    return nil if pub_only

		post
  end

  def self.slug_exists?(val, pub_only)
    p = Post.find_by_slug(val, pub_only)
    p != nil
  end

  def self.find_next_post(post, pub_only)
    return Post.where(:published_on.lte => Time.now,
											:published_on.gt => post.published_on)
		                  .asc(:published_on).first if pub_only
    Post.where(:published_on.gt => post.published_on).desc(:published_on).first
  end

  def self.find_previous_post(post, pub_only)
    return Post.where(:published_on.lte => Time.now, :published_on.lt => post.published_on, :slug.ne => post.slug).desc(:published_on).first if pub_only
    Post.where(:published_on.lt => post.published_on).desc(:published_on).first
  end

	def self.get_page(page, limit, pub_only)
		skip_count = (page-1)*limit
		skip_count = 0 if page < 1
		if pub_only == true
      Post.where(:published_on.lte => Time.now).desc(:published_on).skip(skip_count).take(limit)
		else
      Post.all.desc(:published_on).skip(skip_count).take(limit)
		end
	end

  def self.get_category(page, limit, cat_name, pub_only)
		skip_count = (page-1)*limit
		skip_count = 0 if page < 1
    return Post.where(:category => cat_name,
							 :published_on.lte => Time.now).desc(:published_on)
               .skip(skip_count).take(limit) if pub_only

    Post.where(:category => cat_name).desc(:published_on)
               .skip(skip_count).take(limit)
  end

  def self.find_rss(page, limit, cat_name)
		skip_count = (page-1)*limit
		skip_count = 0 if page < 1
    cat_name ||= ''
    return Post.where(:category => cat_name,
							 :published_on.lte => Time.now).desc(:published_on)
               .skip(skip_count).take(limit) if cat_name != nil && cat_name != ''
    Post.where(:published_on.lte => Time.now).desc(:published_on)
               .skip(skip_count).take(limit)
  end

end

