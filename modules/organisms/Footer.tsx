import Container, { ContainerProps } from '@mui/material/Container';

type FooterProps = Pick<ContainerProps, 'maxWidth'>;

export default function Footer({ maxWidth }: FooterProps) {
  return (
    <footer>
      <Container maxWidth={maxWidth}>Footer</Container>
    </footer>
  );
}
