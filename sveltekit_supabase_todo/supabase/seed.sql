insert into auth.users (
  id,
  instance_id,
  role,
  email,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  encrypted_password,
  created_at,
  updated_at,
  last_sign_in_at
)
values (
  'd93a4410-2ccd-4ab0-a5f6-6eb91a80367b',
  '00000000-0000-0000-0000-000000000000',
  'authenticated',
  'sujeong.jo.mintech@gmail.com',
  '{"provider":"google","providers":["google"]}',
  '{"iss":"https://www.googleapis.com/userinfo/v2/me","sub":"117121908253948656513","name":"조수정","email":"sujeong.jo.mintech@gmail.com","picture":"https://lh3.googleusercontent.com/a/AEdFTp6DDupybBbOb4FNDJVZM7hIFZGojRtDrBw5U88v=s96-c","full_name":"조수정","avatar_url":"https://lh3.googleusercontent.com/a/AEdFTp6DDupybBbOb4FNDJVZM7hIFZGojRtDrBw5U88v=s96-c","provider_id":"117121908253948656513","email_verified":true}',
  false,
  crypt('1234kkkk',
  gen_salt('bf')),
  NOW(),
  NOW(),
  NOW()
), (
  '9175c386-ccb8-43ca-be3e-3c803e273c1b',
  '00000000-0000-0000-0000-000000000000',
  'authenticated',
  'susemi99@gmail.com',
  '{"provider":"google","providers":["google"]}',
  '{"iss":"https://www.googleapis.com/userinfo/v2/me","sub":"115506707701846722244","name":"진창훈","email":"susemi99@gmail.com","picture":"https://lh3.googleusercontent.com/a/AEdFTp4KmtPypi1WXhCQPQEYzvPe4Sya8Xy3bbLOaRTCTXw=s96-c","full_name":"진창훈","avatar_url":"https://lh3.googleusercontent.com/a/AEdFTp4KmtPypi1WXhCQPQEYzvPe4Sya8Xy3bbLOaRTCTXw=s96-c","provider_id":"115506707701846722244","email_verified":true}',
  false,
  crypt('1234kkkk',
  gen_salt('bf')),
  NOW(),
  NOW(),
  NOW()
), (
  '791ebabe-ae24-478a-8126-131238c6da6c',
  '00000000-0000-0000-0000-000000000000',
  'authenticated',
  'dmrv5fhzvj@privaterelay.appleid.com',
  '{"provider":"apple","providers":["apple"]}',
  '{"iss":"https://appleid.apple.com/auth/keys","sub":"001489.9ae98fbf3f13475d8a4fa57f4623ca46.0908","name":"주현 민","email":"dmrv5fhzvj@privaterelay.appleid.com","full_name":"주현 민","provider_id":"001489.9ae98fbf3f13475d8a4fa57f4623ca46.0908","email_verified":true}',
  false,
  crypt('1234kkkk',
  gen_salt('bf')),
  NOW(),
  NOW(),
  NOW()
), (
  'ad3af55d-645f-419f-95fd-a777a45316da',
  '00000000-0000-0000-0000-000000000000',
  'authenticated',
  'j73kabu3q6@privaterelay.appleid.com',
  '{"provider":"apple","providers":["apple"]}',
  '{"iss":"https://appleid.apple.com/auth/keys","sub":"000944.08603b6c455643b39cf7f36cb8a37c12.0636","email":"j73kabu3q6@privaterelay.appleid.com","provider_id":"000944.08603b6c455643b39cf7f36cb8a37c12.0636","email_verified":true}',
  false,
  crypt('1234kkkk',
  gen_salt('bf')),
  NOW(),
  NOW(),
  NOW()
);

-- insert into
--   public.users (
--     id,
--     -- username,
--     full_name,
--     avatar_url,
--     -- phone_number,
--     email,
--     -- birthday,
--     -- role,
--     created_at
--     -- ,
--     -- updated_at
--   )
-- values
--   (
--     'ad3af55d-645f-419f-95fd-a777a45316da'::uuid,
--     -- username,
--     NULL,
--     NULL,
--     -- phone_number,
--     'j73kabu3q6@privaterelay.appleid.com',
--     -- birthday,
--     -- role,
--     '2023-02-06 09:05:14.157287+00'
--     -- ,
--     -- updated_at,
--   ),
--   (
--     '9175c386-ccb8-43ca-be3e-3c803e273c1b'::uuid,
--     -- username,
--     '진창훈',
--     'https://lh3.googleusercontent.com/a/AEdFTp4KmtPypi1WXhCQPQEYzvPe4Sya8Xy3bbLOaRTCTXw=s96-c',
--     -- phone_number,
--     'susemi99@gmail.com',
--     -- birthday,
--     -- role,
--     '2023-02-06 09:06:00.155602+00'
--     -- ,
--     -- updated_at,
--   ),
--   (
--     '791ebabe-ae24-478a-8126-131238c6da6c'::uuid,
--     -- username,
--     '주현 민',
--     NULL,
--     -- phone_number,
--     'dmrv5fhzvj@privaterelay.appleid.com',
--     -- birthday,
--     -- role,
--     '2023-02-06 09:08:40.789802+00'
--     -- ,
--     -- updated_at,
--   ),
--   (
--     'd93a4410-2ccd-4ab0-a5f6-6eb91a80367b',
--     -- username,
--     '초코',
--     NULL,
--     -- phone_number,
--     'sujeong.jo.mintech@gmail.com',
--     -- birthday,
--     -- role,
--     '2023-02-01 09:00:00+00'
--     -- ,
--     -- updated_at,
--   );

insert into
  public.companies (id, name)
values
  (
    'e34b1558-e0f2-484a-aaf7-8d730978b35f',
    'Company1'
  ),
  (
    'ce3453f5-28b9-4417-b8a6-d39c4d89cc0d',
    'Company2'
  ),
  (
    'e3602cf5-44ac-478a-a04e-df0331786486',
    'Company3'
  );

insert into
  public.projects (
    user_id,
    name,
    description,
    category,
    status,
    start_date,
    end_date,
    -- invest_amounts,
    -- min_invest_amounts,
    -- max_invest_amounts,
    -- invest_detail_type,
    -- repayment_method,
    assignment_completion_date,
    thumbnail,
    images,
    -- updated_at,
    company_id
  )
values
  (
    '9175c386-ccb8-43ca-be3e-3c803e273c1b',
    '프로젝트 1',
    '프로젝트 1 설명 프로젝트 1 설명 프로젝트 1 설명 112345',
    'MOVIE',
    'DOING',
    '2023-02-01 00:04:10+00',
    '2023-02-24 09:00:00+00',
    -- invest_amounts,
    -- min_invest_amounts,
    -- max_invest_amounts,
    -- invest_detail_type,
    -- repayment_method,
    '2023-03-31 00:28:41+00',
    'https://fastly.picsum.photos/id/30/500/500.jpg?hmac=25alSLvhfNMgaegkObmJOUwn1Y7cJeSL2fvnvcoE4Qw',
    '{ "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ",
    "https://product.cdn.cevaws.com/var/storage/images/media/adaptil-2017/images/www-ww/shutterstock_395310793-3-2/3547034-1-www-WW/shutterstock_395310793-3-2.jpg" }',
    -- updated_at,
    'e34b1558-e0f2-484a-aaf7-8d730978b35f'
  );