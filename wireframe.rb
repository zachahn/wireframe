require 'bundler'
Bundler.require

register Sinatra::AssetPipeline

get '/' do
  redirect url('/home')
end

get '/*' do
  begin
    slim params[:splat][0].to_sym
  rescue Errno::ENOENT
    pass
  end
end
