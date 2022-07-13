require 'spec_helper'

RSpec.describe Blog do
  subject { described_class.new(title: 'Test', subdomain: 'test') }

  describe '#add_post' do
    it 'adds a post to the posts array' do
      expect do
        subject.add_post(title: 'RSpec Test Doubles Explained', content: 'Lots of great content!')
      end.to change { subject.posts.length }.by(1)
    end

    it 'returns a post' do
      post = subject.add_post(title: 'RSpec Test Doubles Explained', content: 'Lots of great content!')

      expect(post).to be_a(Post)
      expect(post.title).to eql('RSpec Test Doubles Explained')
    end

    it 'associates the post with the blog' do
      post = subject.add_post(title: 'RSpec Test Doubles Explained', content: 'Lots of great content!')

      expect(post.blog).to eql(subject)
    end
  end

  describe '#slug' do
    it 'returns an empty string' do
      expect(subject.slug).to eql('')
    end
  end
end
