def parse_url(url)
  pattern = /^(?<schema>https?):\/\/(?<subdomain>\w*)\.(?<domain>\w*)(?<toplevel>\.[\w\.]*)\/?(?<path>[\w\/]*)\??(?<params>.*)$/
  match = url.match(pattern)
  {
    scheme: match[:schema],
    subdomain: match[:subdomain],
    domain: match[:domain],
    top_level_domain: match[:toplevel],
    path: match[:path].split('/'),
    params: match[:params].split('&').map {|e| e.split('=')}.to_h.transform_keys{|k| k.to_sym}
  }
end
