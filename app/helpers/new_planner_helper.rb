module NewPlannerHelper
  def real_trips_path_by(category)
    if current_user
      real_trips_path(plan: { destination: category.slug, origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    else
      real_trips_path(plan: { destination: category.slug, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    end
  end
end
