node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nginx'
    Chef::Log.debug("Skipping configure #{application} as it is not an PHP app")
    next
  end

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
