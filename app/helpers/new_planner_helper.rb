module NewPlannerHelper
  def real_trips_path_by(category)
    if current_user
      real_trips_path(plan: { destination: category.slug, origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    else
      real_trips_path(plan: { destination: category.slug, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    end
  end

  def real_trips_for_bargain_path
    if current_user
      real_trips_path(plan: { destination: "bargainer", origin: current_user.departure_city_slug, departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD500"} )
    else
      real_trips_path(plan: { destination: Category.all, origin: "unknown", departure_date: 20.days.from_now, return_date: 35.days.from_now, max_price: "USD9999"} )
    end
  end

  def cache_key_for_categories
    count = Category.count
    if current_user
      user_departure_city = current_user.departure_city_slug
      return "Categories/#{count}/#{user_departure_city}"
    end
    return "Categories/#{count}"
  end
end
