require 'minitest/spec'

def service_is_listening( port, service )
  assert system "sudo netstat -lp --numeric-ports | grep \":#{port}.*LISTEN.*#{service}\""
end

def web_check_match( url, check )
  assert system "wget -q -O - #{url} | grep '#{check}'"
end

describe_recipe 'sonarqube::default' do

  # XXX 
  # use port from attributes
  #it "listens for java on tcp port 8080" do
  #  service_is_listening("8080", "java")
  #end

  #it 'must match the check tomcat' do
  #  web_check_match("http://localhost:8080/", "tomcat")
  #end

end
