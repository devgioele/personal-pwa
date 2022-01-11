import Container, { ContainerProps } from '@mui/material/Container';

type FooterProps = Pick<ContainerProps, 'maxWidth'> & {
  width: string;
};

export default function Footer({ maxWidth, width }: FooterProps) {
  return (
    <footer>
      <Container maxWidth={maxWidth} sx={{ width }}>
        Footer
      </Container>
    </footer>
  );
}
