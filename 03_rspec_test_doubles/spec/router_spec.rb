require 'spec_helper'

RSpec.describe Router do
  subject { described_class.new(domain: 'blog.com') }

  describe 'url_for' do
    context 'with a post' do
      it 'returns the full URL with protocol, subdomain and path' do
        post = instance_double('Post', subdomain: 'test', slug: 'using-rspec-test-doubles')

        expect(subject.url_for(post)).to eql(
          'https://test.blog.com/using-rspec-test-doubles'
        )
      end
    end

    context 'with a blog' do
      it 'returns the full URL with protocol and subdomain and no path' do
        blog = instance_double('Blog', subdomain: 'test', slug: '')

        expect(subject.url_for(blog)).to eql(
          'https://test.blog.com/'
        )
      end
    end

    context 'with an object that does not implement subdomain and slug' do
      it 'returns a NotRoutableError' do
        unroutable = double('unroutable')

        expect { subject.url_for(unroutable) }.to raise_error(described_class::NotRoutableError)
      end
    end
  end
end
