require_relative "../url_parser"

describe "parse_url" do
  it "returns the correct hash for a URL without path and params" do
    url = "http://www.lewagon.com/"
    expect(parse_url(url)).to match({ scheme: "http", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: [], params: {} })
  end

  it "returns the correct hash for a URL with multiple paths and no params" do
    url = "https://www.lewagon.com/courses/apply"
    expect(parse_url(url)).to match({ scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["courses", "apply"], params: {} })
  end

  it "returns the correct hash for a URL with path and params" do
    url = "https://www.lewagon.com/berlin?search=currywurst"
    expect(parse_url(url)).to match({ scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["berlin"], params: { search: "currywurst" } })
  end

  it "returns the correct hash for a URL with path and multiple params" do
    url = "https://www.lewagon.com/london?bootcamp=web&season=autumn"
    expect(parse_url(url)).to match({ scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["london"], params: { bootcamp: "web", season: "autumn" }})
  end
end
