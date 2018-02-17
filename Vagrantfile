Vagrant::Config.run do |config|
  # ベースとなるBoxイメージを指定
  config.vm.box = "precise64"
   
  # Webサーバの構築
  config.vm.define "web" do |web|
    # ポートフォワーディング(localhost:8080をVMの80に転送する)
    web.vm.forward_port 80, 8080
    # ホストからのみアクセスできるローカルIPを付与する
    web.vm.network :hostonly, "192.168.33.10"
    # 共有フォルダの設定(ホストの特定のフォルダ以下を、VMからアクセスできるようにする)
    web.vm.share_folder "v-root", "/vagrant", "."

    # シェルによるプロビジョニング(コマンド実行、ChefやPuppetも可能)
    web.vm.provision :shell, path: "web_provision.sh"
    # Vagrantfile 内で、直接コマンドを実行したい場合
    web.vm.provision :shell, inline: "apt-get install -y mysql-client"
  end 

  # Db(Mysql)サーバの構築
  config.vm.define "db" do |db|
    db.vm.network :hostonly, "192.168.33.11"
    db.vm.provision :shell, path: "db_provision.sh"
  end
end
