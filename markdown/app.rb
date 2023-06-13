require 'sinatra'
require 'sinatra/base'
require 'redcarpet'
require 'mustache'

set :bind, '0.0.0.0'
set :port, 4567

def render_file(f)
  if File.exist?(f)
    content_type 'text/plain'
    send_file f, disposition: :inline
  else
    response.headers['Location'] = '/'
    status 303
  end
end

def get_map
  map = {
    MYHOSTNAME: ENV['MYHOSTNAME']
  }
  [
    'start',
    'dashboard',
    'home',
    'stop'
  ].each do |t|
    map[t] = Mustache.render(File.open("/#{t}.md").read, map)
  end
  map
end

def render_md(file)
  f = "/www/#{file}.md"
  if File.exist?(f)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {tables: true, fenced_code_blocks: true})
    data = Mustache.render(File.open(f).read, get_map)
    css = File.open("/home.css").read
    "#{markdown.render(data)}#{css}"
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
