/**
 * @author PT. ESD - Telkom University
 * @copyright © All rights reserved. Dashboard 2023
 */

export async function getServerSideProps() {
  return {
    redirect: {
      destination: '/dashboard/index_dashboard',
      permanent: false,
    },
  };
}

export default function HomePage() {
  return null;
}
