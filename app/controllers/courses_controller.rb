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
        "dintro",
        "dork"
    ]

    @currentstep = @order[@step]

    @deontvsutil = [
        ["Statt seinem reichen Freund wie versprochen das Geld zurückzugeben, spendet Stefan es an bedürftige Menschen.","ut", "Stefan versucht bedürftigen Menschen zu helfen und bricht dabei ein Versprechen. Er handelt utilitaristisch."],
        ["Lorenz verarztet einen verwundeten, feindlichen Soldaten.", "deon", "Da der Soldat Lorenz feindlich gesinnt ist, wäre es aus der Sicht von Lorenz besser, den feindlichen Soldaten zu töten, statt zu verarzten. Doch Lorenz scheint zu denken, dass es intrinsisch schlecht ist, einem verwundeten Menschen nicht zu helfen."],
        ["Fabian weigert sich, einen Terrorist zu foltern, um die von ihm versteckte Bombe zu finden.", "deon", "Eine Bombe könnte viele Menschen töten und verletzen. Ein Utilitarist würde auf die Folgen der Handlung schauen und sagen, dass durch die Folter weniger Menschen leiden müssten, als wenn nicht gefoltert wurde."],
        ["Lara zündet ein Haus an, um die Behörden auf die mangelhafte Feuerwehr aufmerksam zu machen.", "ut", "Laura erhofft sich durch ihre gefährliche Tat, dass die Behörden mehr in die Feuerwehr investieren. Dabei schaut sie auf die Folgen, nicht auf die Tat selbst."],
        ["Viele Menschen sind krank geworden. Obwohl Nadja weiss, dass ihre Medikamente nichts nützen, erzählt sie den Menschen, dass ihre Medikamente ihnen helfen würden. Sie hofft auf den Placebo-Effekt.", "ut", "Nadja lügt, in der Hoffnung gute Folgen hervorzurufen. Sie schaut auf die Folgen, nicht auf die Handlung selbst."]
    ]

    @whatareyou = [
        ["Würdest du einen Menschen umbringen, um 5 Menschen das Leben zu retten?", "Ja, ich würde dafür einen Menschen umbringen.", "Nein, ich würde dafür keinen Menschen umbringen.",[0,1]],
        ["Würdest du lügen, um einen Streit zwischen deinen Freunden zu vermeiden?", "Ja, ich würde dafür lügen.", "Nein, ich würde meinen Freunden die Wahrheit sagen.",[0,1]],
        ["Würdest du einen Lehrer bestechen, so dass ein unartiger Schüler schlechtere Noten bekommt?", "Antwort", "Antwort", [0,1]]
    ]

  end
end
