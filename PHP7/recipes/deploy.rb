node[:deploy].each do |application, deploy|

  # write out opsworks.php
  template "/etc/nginx/sites-enabled/atabase" do
    source 'atabase'
    mode '0660'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :path => deploy[:user]
    )
    only_if do
      File.exists?("/etc/nginx/sites-enabled")
    end
  end
end

script "Restart NGINX" do
  interpreter "bash"
  user 'root'
  code <<-EOH
      service nginx restart
  EOH
end
