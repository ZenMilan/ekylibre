{ :fra=>{
    :i18n=>{
      :dir=>:ltr,
      :iso2=>:fr,
      :name=>'Français',
      :plural=>{
        :keys=> [:one, :other],
        :rule=> lambda { |n| n<2 ? :one : :other }
      }
    }
  }
}
