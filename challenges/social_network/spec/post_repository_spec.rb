require "post_repository"
require "post"

def reset_posts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
    connection.exec(seed_sql)
end
  
RSpec.describe PostRepository do
    before(:each) do 
      reset_posts_table
    end

    it "gets all posts" do
        repo = PostRepository.new
        posts = repo.all
        expect(posts.length).to eq 4
        expect(posts[0].id).to eq '1'
        expect(posts[0].title).to eq 'Day one'
        expect(posts[1].id).to eq '2'
        expect(posts[1].content).to eq 'Trip to London'
        expect(posts[1].views).to eq '10'
    end

    it " Get a single post" do
        repo = PostRepository.new
        post = repo.find(1)
        expect(post.id).to eq '1'
        expect(post.title).to eq 'Day one'
        expect(post.content).to eq 'Trip to Manchester'
    end

    it "Create a new post" do
        repo = PostRepository.new
        new_post = Post.new
        new_post.title = 'Day five'
        new_post.content = 'Trip to Inverness'
        new_post.views = '9'
        repo.create(new_post)
        posts = repo.all
        expect(posts.last.id).to eq '5'
        expect(posts.last.title).to eq 'Day five'
        expect(posts.last.content).to eq 'Trip to Inverness'
        expect(posts.last.views).to eq '9'
    end

    it "Update a post" do
        repo = PostRepository.new
        post = repo.find(1)
        post.views = '50'
        repo.update(post)
        expect(post.views).to eq '50'
    end

    it "Delete a post" do
        repo = PostRepository.new
        repo.delete(2)
        posts = repo.all
        expect(posts.length).to eq 3
    end
end