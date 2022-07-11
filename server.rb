require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  request_headers = request.env.select { |k, v| k.start_with?('HTTP_') }
  request_headers.each do |k, v|
    puts "#{k}: #{v}"
  end
end

get '/:error/:age/*' do
  headers \
    "Cache-Control" => "max-age=#{params[:age]}"
  body "<pre>#{params[:error]} error\nTime: #{Time.now.to_s}</pre>\n"
  params[:error].to_i
end

get '/:error/*' do
  body "<pre>#{params[:error]} error\nTime: #{Time.now.to_s}</pre>\n"
  params[:error].to_i
end

post '/:error/:age/*' do
  headers \
    "Cache-Control" => "max-age=#{params[:age]}"
  body "<pre>#{params[:error]} error\nTime: #{Time.now.to_s}</pre>\n"
  params[:error].to_i
end

post '/:error/*' do
  body "<pre>#{params[:error]} error\nTime: #{Time.now.to_s}</pre>\n"
  params[:error].to_i
end
