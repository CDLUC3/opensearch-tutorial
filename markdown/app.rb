require 'sinatra'
require 'sinatra/base'
require 'redcarpet'
require 'mustache'

set :bind, '0.0.0.0'
set :port, 4567

def render_file(f)
  if File.exist?(f)
    send_file f
  else
    response.headers['Location'] = '/'
    status 303
  end
end

def render_md(file)
  f = "/www/#{file}.md"
  if File.exist?(f)
    map = {
      MYHOSTNAME: ENV['MYHOSTNAME']
    }
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {tables: true, fenced_code_blocks: true})
    data = Mustache.render(File.open(f).read, map)
    markdown.render(data)
  elsif f == '/www/README.md'
    status 404
  else
    response.headers['Location'] = '/'
    status 303
  end
end

get "*.md" do
  render_md(params['splat'][0])
end

get "*/" do
  render_md("#{params['splat'][0]}/README")
end

get "*" do
  render_file("/www/#{params['splat'][0]}")
end

get "/" do
  render_md('README.md')
end
