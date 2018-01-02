class CoursesController < ApplicationController
  before_action :authenticate_user!
  def ethics
    print request.format
    @request = request.format

    @ethiccssclass = "jumbotron text-justify yellowish mt-3"

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
        "dork",
        "tintro",
        "memory",
        "whichisright",
        "dcases",
        "kinstrument",
        "tformal",
        "dwp",
        "utgf",
        "prot",
        "konk",
        "kond",
        "kont"
    ]

    @dconflicts = [
        "Die Pflicht, ausgeliehene Waffen zurückzugeben.",
        "Die Pflicht, keine Waffen auszuleihen.",
        "Die Pflicht, einem Wahnsinnigen keine Waffen zu geben",
        "Die Pflicht, Wahnsinnigen die Waffen wegzunehmen."
    ]

    @kutgf = [
        "Die Frau hat ihre Liebe nur vorgespielt. Selbst wenn wir für 5 Monate sehr glücklich waren, war es falsch von ihr, uns die Liebe vorzuspielen.",
        "Nur wahre Liebe macht einen glücklich",
        "Dieses Gedankenexperiment will zeigen, dass ",
        "Die Pflicht, Wahnsinnigen die Waffen wegzunehmen."
    ]

    @ethicaltheories = [
        "Deontologie",
        "Konsequentialismus",
        "Tugendethik"
    ]

    @dproblems = [
        "Deontologische Ethiken sind zu kompliziert, um befolgt zu werden.",
        "In gewissen Situationen kann man sich entscheiden wie man will, man macht, deontologisch gesehen, immer etwas falsch.",
        "Gewisse Handlungen, die deontologisch gut sind, führen möglicherweise zu Handlungen, die deontologisch schlecht sind.",
        "d"
    ]

    @kproblems = [
        "Der Konsequentialismus hat zu wenige Anhänger, um ernst genommen zu werden.",
        "Der Konsequentialismus behauptet, dass wir immer lügen und stehlen sollen.",
        "Der Konsequentialismus hat zur Folge, dass wir",
        "Der Konsequentialismus zieht Absichten und Intentionen nicht in Erwägung.",
        "Da die Willensfreiheit eine Illusion ist, kann man sich gar nicht für eine Handlung entscheiden.",
        "Früher oder später hat jede Handlung gute Folgen, deshalb spielt es keine Rolle, wie man sich entscheidet.",
        "In gewissen Situationen verlangt der Konsequentialismus, dass wir lügen, stehlen oder morden sollen.",
        "Der Konsequentialismus verlangt, dass wir vor jeder Entscheidung zu einer Wahrsagerin gehen.",
        "Der Konsequentialismus impliziert, dass jede Ursache eine Wirkung haben muss."
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
        ["Du hast 200 Franken von einem reichen Freund geliehen. Er ist sehr vergesslich. Er hat bereits vergessen, dass er dir 200 Franken geliehen hat. Würdest du ihm das Geld wie versprochen zurückgeben oder würdest du es für einen guten Zweck spenden?", "Ich würde das Geld für einen guten Zweck spenden.", "Ich würde das Geld wie versprochen zurückgeben.",[0,1]],
        ["Du kennst einen Politiker, der korrupt ist. Leider hast du nicht genügend Beweise, um ihn auf normalen Wegen hinters Licht zu führen. Würdest du einen Richter bestechen, so dass der korrupte Politiker dennoch eingesperrt wird?", "Ja, ich würde dafür den Richter bestechen.", "Nein, ich würde dafür keinen Richter bestechen.", [0,1]],
        ["Du bist Arzt. Du hast einen kranken Patienten und du weisst, dass keine deiner Medikamente ihm helfen können. Würdest du dem Patienten ein Placebo verabreichen und ihm sagen, dass ihm dieses Medikament helfen kann?", "Ja, ich würde dem Patienten ein Placebo geben.", "Nein, ich würde dem Patienten sagen, dass ich keine Medikamente für ihn habe.", [0,1]],
        ["Ein Terrorist hat eine Bombe in der Stadt versteckt, die Tausenden von Menschen das Leben kosten wird. Würdest du den Terroristen foltern, um den Ort der Bombe herauszufinden?", "Ja, ich würde den Terroristen foltern.", "Nein, ich würde den Terroristen nicht foltern.", [0,1]],
        ["Die örtliche Feuerwehr ist seit Jahren unterbezahlt und leidet an Personalmangel. Die Behörden weigern sich vehement, in die Feuerwehr zu investieren. Würdest du ein Haus anzünden, um die Behörden zum Umdenken zu bewegen?", "Ja, ich würde deswegen ein Haus anzünden.", "Nein, ich würde deswegen kein Haus anzünden.", [0,1]],
        ["Du bist Chirurg und ein Experte für Transplantationschirurgie. Du hast 4 Patienten, die dringend neue Organe benötigen. Zufälligerweise sitzt eine Person im Wartesaal,
          dessen Organe allen 4 Patienten das Leben retten könnten. Würdest du diese Person im Wartesaal für die anderen 4 Patienten opfern?", "Ja, ich würde diese Person für die anderen 4 opfern.", "Nein, ich würde diese Person nicht opfern.", [0,1]],
        ["Terroristen haben eine Geisel genommen und fordern Lösegeld. Die fordernden Terroristen sind bekannt dafür, dass sie ihr Wort halten und die Geisseln nach Erhalt des Lösegelds freilassen. Würdest du mit diesen Terroristen verhandeln und das Lösegeld zahlen?", "Ja, ich würde mit den Terroristen verhandeln.", "Nein, ich würde nicht mit den Terroristen verhandeln.", [0,1]],
    ]

    @memory = [
        ["Ob eine Handlung gut oder schlecht ist, hängt von den Folgen ab, die eine Handlung nach sich zieht.", 1],
        ["Konsequentialismus", 1],
        ["Ob eine Handlung gut oder schlecht ist, hängt von der Handlung selbst ab.", 2],
        ["Deontologie", 2],
        ["Eine Handlung ist gut, wenn sie viel Glück produziert und schlecht, wenn sie viel Leid verursacht.", 3],
        ["Utilitarismus", 3],
        ["Klugheit, Weisheit, Gerechtigkeit, Tapferkeit, Mässigung sind vorzügliche Eigenschaften eines Menschen.", 4],
        ["Tugende", 4],
        ["Was du nicht willst, dass man dir tu, das füg auch keinem andern zu.", 5],
        ["Goldene Regel", 5],
        ["Tugendethik", 6],
        ["Ob eine Handlung gut oder schlecht ist, hängt von der dahinterstehenden Motivation ab.", 6]
    ]

    @memory.shuffle!

    respond_to do |format|
      format.html
      format.js { render 'courses/ethics/fader.js.erb' }
    end
  end

  def addpoints
    @points = params[:points]

    current_user.points = current_user.points + @points.to_i
    current_user.save

    @points = current_user.points

    render 'addpoints.js.erb'

  end

  def addanswer
    @questionnumber = params[:questionnumber]
    @answer = params[:answer]

    e = current_user.ethic

    if @questionnumber.to_i == 9
      e.update(dork: @answer)
      rearrangeorder
    else
      e.answers[@questionnumber] = @answer
      if @answer.downcase.include?("ja")
        e.konsanswers[@questionnumber] = @answer
      else
        e.deonanswers[@questionnumber] = @answer
      end
    end

    e.save

    if @questionnumber.to_i == 9
      e.update(dork: @answer)
    end

    print e.answers

    head :ok
  end

  def exercisecompleted
    model = params[:model]
    exercise = params[:exercise]
    state = params[:state]
    @points = params[:points]

    usermodel = model.singularize.classify.constantize.find_by_user_id(current_user.id)

    currentprogress = usermodel.progress

    usermodel.update(progress: currentprogress + 10)

    if usermodel.exercises[exercise] == "completed"
      print "NOTHING!!!"
       head :ok
    else
      print usermodel.exercises[exercise]

      usermodel.exercises[exercise] = state
      print usermodel.exercises[exercise]
      usermodel.save

      print usermodel.exercises

      current_user.points = current_user.points + @points.to_i
      current_user.save

      @points = current_user.points

      render 'addpoints.js.erb'
    end
  end

end
