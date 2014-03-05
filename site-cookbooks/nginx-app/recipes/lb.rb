template "default.conf" do
  path "/etc/nginx/conf.d/default.conf"
  source "lb.conf"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end
