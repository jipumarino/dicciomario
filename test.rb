require 'rubygems'
require 'sinatra'

get '/?' do
  doc=open('dict.txt')
  @diccionario=doc.map{|x| x.delete("\n").split("|")}
  doc.close
  erb :dicciomario
end

get '/add/:mario/:mundo/?' do
  File.open('dict.txt', 'a') {|f| f.write(params[:mario]+"|"+params[:mundo]+"\n") }
  redirect('/dicciomario')
end

get '/del/:mario/:mundo/?' do
  search=params[:mario]+"|"+params[:mundo]+"\n"
  f=open('dict.txt', 'r')
  new_content=f.read.gsub(search,"")
  f.close
  open('dict.txt', 'w'){|f| f.write(new_content)}
  redirect('/dicciomario')
end
