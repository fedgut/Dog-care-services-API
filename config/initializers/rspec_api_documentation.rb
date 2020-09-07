module RspecApiDocumentation
    class RackTestClient < ClientBase
      def response_body
        last_response.body.encode("utf-8")
      end
    end
  end