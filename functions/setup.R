# read student home tract data
student_home_tracts_23 <-
  read_xlsx("data/home_tracts/REVISED Banner Request-Enroll by Prog and Tract-2024.08.08.xlsx", sheet = 2, skip = 5) %>%
  clean_names() %>%
  mutate(prog_no = as.character(prog_no)) %>%
  # change all colnames to character
  mutate(across(-c(prog_no, program, enrollment), ~ as.numeric(as.character(.)))) %>%
  # Pivot longer to convert census tract columns into rows
  pivot_longer(
    cols = -c(prog_no, program, enrollment),
    names_to = "census_tract",
    values_to = "students"
  ) %>%
  # left_join(hs_parcel_join, by = c("prog_no" = "school_number")) %>%
  dplyr::select(prog_no, program, enrollment, school_name, name, everything()) %>%
  mutate(students = ifelse(is.na(students), 5, students)) %>%
  filter(!is.na(school_name),
         students > 0
  )  %>%
  dplyr::select(-x, -y, -join_addr.y, -GlobalID, -class, -category, -OBJECTID, -join_addr.x) %>%
  rename(school_polygon = geometry.x,
         school_point = geometry.y) %>%
  mutate(school_point = st_make_valid(school_point)) %>%
  mutate(school_point_lat = st_coordinates(school_point)[, 2],
         school_point_lon = st_coordinates(school_point)[, 1],
         census_tract = str_remove_all(census_tract, "x")) %>%
  as.data.frame() %>%
  # There are two ways that we can assign students home tracts
  # first we can simply use "bmore_tracts_join", an sf object that simply takes the centerpoint of each tract
  # the upside here is that it's easier and its consistent
  # The downside is that sometimes it can put our point at a place we know no one lives, like a park or industrial area
  # left_join(bmore_tracts_join, by = c("census_tract" = "geoid"))
  # The second method is to sample human settlement points from the raster grid and join them to the tracts
  # We'll then take a random point from each tract to represent the students home location
  # This is probably more accurate but it's also more computationally expensive
  # We'll do both and compare the results
  left_join(baltimore_grid_sampled, by = c("census_tract" = "GEOID")) %>%
  rename(
    tract_point_lat = lat,
    tract_point_lon = lon
  )

here::here()
