require 'rack'

class PersonalSite

  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/main.css' then css
  
    end
  end

  def self.css
    render_static('main.css')
  end

  def self.render_static(asset)
    [200, {'Content-Type' => 'text/html'}, [File.read("./public/#{asset}")]]
  end

  def self.index
    render_view('index.html')
  end


  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
  end

end
