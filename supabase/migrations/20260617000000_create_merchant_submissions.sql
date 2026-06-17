-- ThinkUni Merchant Form submissions table
CREATE TABLE IF NOT EXISTS public.merchant_submissions (
  id              uuid          DEFAULT gen_random_uuid() PRIMARY KEY,
  submitted_at    timestamptz   DEFAULT now() NOT NULL,
  business_name   text,
  contact_name    text,
  whatsapp        text,
  email           text,
  city            text,
  instagram       text,
  website         text,
  category        text,
  other_category  text,
  gen_z_importance integer,
  customer_types  jsonb         DEFAULT '[]'::jsonb,
  genz_reach      text,
  pain_points     jsonb         DEFAULT '[]'::jsonb,
  other_pain_description text,
  core_answer     text,
  value_drivers   jsonb         DEFAULT '[]'::jsonb,
  offer_structures jsonb        DEFAULT '[]'::jsonb,
  offer_model     text,
  offer_capacity  text,
  launch_speed    text,
  decision_maker  text,
  contact_method  text,
  open_question   text,
  lead_score      integer       DEFAULT 0,
  lead_tier       text          DEFAULT 'LOW',
  ab_variant      text
);

-- Enable RLS
ALTER TABLE public.merchant_submissions ENABLE ROW LEVEL SECURITY;

-- Anyone can insert (form submissions)
CREATE POLICY "public_insert"
  ON public.merchant_submissions
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Anyone can read (dashboard uses anon key)
CREATE POLICY "public_read"
  ON public.merchant_submissions
  FOR SELECT
  TO anon
  USING (true);
