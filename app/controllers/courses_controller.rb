class CoursesController < ApplicationController
  def ethics
    @step = 0
    if params[:step] == nil
      @step = 0
    else
      @step = params[:step].to_i
    end

    @order = [
        "introduction",
        "ethicaltheories",
        "kintro",
        "dintro"
    ]

    print @order
    print @order[@step]
    @currentstep = @order[@step]

  end
end
