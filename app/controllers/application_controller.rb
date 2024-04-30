class ApplicationController < ActionController::Base
  def server_side_rendering
    @total_count = 5
    @jobs = [
      {
        id: 1,
        title: 'Job Title 1st'
      },
      {
        id: 2,
        title: 'Job Title 2nd'
      },
      {
        id: 3,
        title: 'Job Title 3rd'
      },
      {
        id: 4,
        title: 'Job Title 4th'
      },
      {
        id: 5,
        title: 'Job Title 5th'
      }
    ]
  end

  def client_side_rendering; end

  def api
    #head :unauthorized; return

    render json: {
      total_count: 5,
      jobs: [
        {
          id: 1,
          title: 'Job Title 1st'
        },
        {
          id: 2,
          title: 'Job Title 2nd'
        },
        {
          id: 3,
          title: 'Job Title 3rd'
        },
        {
          id: 4,
          title: 'Job Title 4th'
        },
        {
          id: 5,
          title: 'Job Title 5th'
        }
      ]
    }
  end
end
