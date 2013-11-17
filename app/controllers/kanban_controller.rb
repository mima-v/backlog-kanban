class KanbanController < ApplicationController
  def index
    @result = testapi
  end

  private
    def testapi
      host = 'kanban.backlog.jp'
      path = '/XML-RPC'
      port = '443'
      proxy_host = nil
      proxy_port = nil
      user = 'api'
      password = 'api1117'
      use_ssl = true
      timeout = 60

      client = XMLRPC::Client.new(host, path, port, proxy_host, proxy_port, user, password, use_ssl, timeout)

      begin
        #プロジェクト情報が表示される
        #result = client.call('backlog.getProject', プロジェクト番号)

        #ユーザー情報が表示される
        #result = client.call('backlog.getUsers', ユーザー番号 )

        #自分のタイムラインが表示される（重い）
        #result = client.call('backlog.getTimeline')
        result = client.call('backlog.findIssue', {'projectId' => 1073817496})

      rescue XMLRPC::FaultException => e
        puts "fault #{e.faultCode}: #{e.faultString}"
      end
    end
end