module WidgetsHelper
  def for_widget(wid, stmt=nil)
    stmt = wid.execute_json if stmt.nil?
    d = wid.cols.select(&:dimension?)
    m = wid.cols.select(&:metric?)

    data = stmt.map do |hs| 
      { name: hs.values_at(*d.map{|i| i.name.downcase}), 
        data: hs.values_at(*m.map{|i| i.name.downcase}) }
    end
 
    return {
        xAxis: {
            categories: d.map(&:label) 
        },
        yAxis: {
            title: { text: m.map(&:label) },
        },
       series: (wid.pie?)? for_pie(data, m.map(&:label).join): data
    }
  end
  def for_pie(data, name_slice)
    series = [{type: 'pie', name:name_slice, data:data.map(&:values).map(&:flatten)}]
  end
end
