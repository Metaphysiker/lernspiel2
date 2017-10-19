class CoursesController < ApplicationController
  def ethics
    step = 0
    if params[:step] == nil
      step = 0
    else
      step = params[:step].to_i

    end

    @order = [
        "introduction",
        "ethicaltheories"
    ]

    print @order[0]
    @currentstep = @order[step]

  end
end
